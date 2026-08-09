// Package vault stores encrypted blobs and hands out short-lived share links.
package vault

import (
	"errors"
	"fmt"
	"time"
)

// Link is a share that expires on its own.
type Link struct {
	ID      string
	Expires time.Time
	Public  bool
}

const (
	maxTTL   = 72 * time.Hour
	tokenLen = 32
)

var ErrExpired = errors.New("vault: link has expired")

// Resolve returns the blob behind a share link, or why it cannot.
func (l *Link) Resolve(now time.Time) (string, error) {
	if now.After(l.Expires) {
		return "", fmt.Errorf("%w: %s", ErrExpired, l.ID)
	}
	if !l.Public {
		return "", errors.New("vault: link is private")
	}
	return l.ID, nil
}
